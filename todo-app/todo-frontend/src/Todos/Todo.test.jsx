import { test, expect } from 'vitest'
import { render, screen } from '@testing-library/react'

import Todo from './Todo'

test('renders todo text', () => {
  const todo = { text: 'Test todo', done: false }

  render(
    <Todo
      todo={todo}
      deleteTodo={() => {}}
      completeTodo={() => {}}
    />
  )

  expect(screen.getByText('Test todo')).toBeDefined()
})